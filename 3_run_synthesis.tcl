set bit_width $env(BIT_WIDTH)

set params_file "set_of_params.txt"

set stdcells_lib asap7/asap7sc7p5t_SIMPLE_SEQ.lib
set constr asap7/asap7.constr

# путь до директории со скриптами abc
set abc_scripts_dir abc_scripts

# путь до директории с верилог-кодом
set input_dir bitwidth_$bit_width

# куда сохраняем результаты
set logs_dir bitwidth_${bit_width}_output

set top_name "adder"

set modules_files [glob $input_dir/*.v]

set D 100

# read file with parameters :
set fp [open $params_file r]
set file_data [read $fp]
close $fp 
set data [split $file_data "\n"]

set n 0
foreach fname $modules_files {

    set leaf_fname [file rootname [file tail $fname]]
    set numbers [regexp -all -inline -- {[0-9]+} $leaf_fname]

    puts $fname

    foreach line $data { 

        if {$line eq ""} {
            break
        }

        set params [regexp -inline -all -- {\S+} $line]

        set p0 [lindex $params 0]
        set p1 [lindex $params 1]
        
	    yosys design -reset 
	    yosys read_verilog -overwrite $fname
      
        if {$p0 == 1} {yosys synth -top $top_name} else {yosys hierarchy -top $top_name}

        yosys opt

        yosys flatten

        yosys opt

        yosys techmap

        yosys opt

        set abc_log $logs_dir/abc_$n.log
        set yosys_log $logs_dir/yosys_$n.json 
        set netlist_file $logs_dir/netlist_$n.v
        set netlist_inter_file $logs_dir/netlist_inter_$n.v
        set params_file $logs_dir/params_$n.log
        set rtlil_file $logs_dir/rtlil_$n.txt
        set blif_file $logs_dir/blif_$n.blif

        set fp [open $params_file w]
        puts $fp [string cat $fname " " $params]
        close $fp  
       
        yosys write_verilog -noattr -noexpr -siminit -simple-lhs $netlist_inter_file

        yosys dfflibmap -liberty $stdcells_lib

        set script_path $abc_scripts_dir/script_$p1.abcs

        yosys write_blif -noalias $blif_file

        yosys tee -o $abc_log abc -D $D -constr $constr -liberty $stdcells_lib -script $script_path

        yosys opt
        yosys clean -purge

        yosys tee -o $yosys_log stat -liberty $stdcells_lib -json
        yosys write_verilog -noattr -noexpr -siminit -simple-lhs $netlist_file

        yosys write_rtlil $rtlil_file

        incr n

    }


}

