// OpenSTA, Static Timing Analyzer
// Copyright (c) 2025, Parallax Software, Inc.
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.
// 
// The origin of this software must not be misrepresented; you must not
// claim that you wrote the original software.
// 
// Altered source versions must be plainly marked as such, and must not be
// misrepresented as being the original software.
// 
// This notice may not be removed or altered from any source distribution.

%module sdf

%{
#include "sdf/SdfReader.hh"
#include "sdf/ReportAnnotation.hh"
#include "sdf/SdfWriter.hh"
#include "Search.hh"
#include "Sta.hh"

using sta::Sta;
using sta::AnalysisType;
using sta::MinMax;
using sta::MinMaxAllNull;
using sta::stringEq;
using sta::readSdf;
using sta::reportAnnotatedDelay;
using sta::reportAnnotatedCheck;

%}

%inline %{

// If unescaped_dividers is true path names do not have to escape
// hierarchy dividers when the path name is quoted.
// For example verilog "\mod1/mod2 " can be referenced as "mod1/mod2"
// instead of the correct "mod1\/mod2".

// Return true if successful.
bool
read_sdf_file(const char *filename,
              const char *path,
              Corner *corner,
              bool unescaped_dividers,
              bool incremental_only,
              MinMaxAllNull *cond_use)
{
  Sta *sta = Sta::sta();
  sta->ensureLibLinked();
  sta->ensureGraph();
  if (stringEq(path, ""))
    path = NULL;
  bool success = readSdf(filename, path, corner, unescaped_dividers, incremental_only,
                         cond_use, sta);
  sta->search()->arrivalsInvalid();
  return success;
}

void
report_annotated_delay_cmd(bool report_cells,
			   bool report_nets,
			   bool report_in_ports,
			   bool report_out_ports,
			   unsigned max_lines,
			   bool list_annotated,
			   bool list_not_annotated,
			   bool report_constant_arcs)
{
  Sta *sta = Sta::sta();
  sta->ensureLibLinked();
  sta->ensureGraph();
  reportAnnotatedDelay(report_cells, report_nets,
		       report_in_ports, report_out_ports,
		       max_lines, list_annotated, list_not_annotated,
		       report_constant_arcs, sta);
}

void
report_annotated_check_cmd(bool report_setup,
			   bool report_hold,
			   bool report_recovery,
			   bool report_removal,
			   bool report_nochange,
			   bool report_width,
			   bool report_period,
			   bool report_max_skew,
			   unsigned max_lines,
			   bool list_annotated,
			   bool list_not_annotated,
			   bool report_constant_arcs)
{
  Sta *sta = Sta::sta();
  sta->ensureLibLinked();
  sta->ensureGraph();
  reportAnnotatedCheck(report_setup, report_hold,
		       report_recovery, report_removal,
		       report_nochange, report_width,
		       report_period,  report_max_skew,
		       max_lines, list_annotated, list_not_annotated,
		       report_constant_arcs, sta);
}

void
write_sdf_cmd(char *filename,
	      Corner *corner,
	      char divider,
	      bool include_typ,
              int digits,
	      bool gzip,
	      bool no_timestamp,
	      bool no_version)
{
  Sta *sta = Sta::sta();
  sta->ensureLibLinked();
  sta->writeSdf(filename, corner, divider, include_typ, digits, gzip,
		no_timestamp, no_version);
}

%} // inline
