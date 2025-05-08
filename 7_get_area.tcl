set stdcells_lib asap7/asap7sc7p5t_SIMPLE_SEQ.lib

# путь до директории с верилог-кодом
set input_dir bitwidth_4_fa
set top_name "top"

set modules_files [glob $input_dir/*.v]

foreach fname $modules_files {

    set leaf_fname [file rootname [file tail $fname]]
    set numbers [regexp -all -inline -- {[0-9]+} $leaf_fname]
    set n [lindex $numbers 0]

    puts $fname

    set yosys_log [string cat $input_dir/yosys_$n.json]

    yosys design -reset 
    yosys read_liberty -lib $stdcells_lib
    yosys read_verilog -overwrite $fname 

    yosys tee -o $yosys_log stat -liberty $stdcells_lib -json

}

   

