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

%module power

%{
#include "Sta.hh"
#include "Sdc.hh"
#include "power/Power.hh"
#include "power/VcdReader.hh"
#include "power/SaifReader.hh"

using namespace sta;

%}

%inline %{

static void
pushPowerResultFloats(PowerResult &power,
		      FloatSeq &powers)
{
  powers.push_back(power.internal());
  powers.push_back(power.switching());
  powers.push_back(power.leakage());
  powers.push_back(power.total());
}

FloatSeq
design_power(const Corner *corner)
{
  PowerResult total, sequential, combinational, clock, macro, pad;
  Sta::sta()->power(corner, total, sequential, combinational, clock, macro, pad);
  FloatSeq powers;
  pushPowerResultFloats(total, powers);
  pushPowerResultFloats(sequential, powers);
  pushPowerResultFloats(combinational, powers);
  pushPowerResultFloats(clock, powers);
  pushPowerResultFloats(macro, powers);
  pushPowerResultFloats(pad, powers);
  return powers;
}

FloatSeq
instance_power(Instance *inst,
	       const Corner *corner)
{
  Sta *sta = Sta::sta();
  PowerResult power = sta->power(inst, corner);
  FloatSeq powers;
  powers.push_back(power.internal());
  powers.push_back(power.switching());
  powers.push_back(power.leakage());
  powers.push_back(power.total());
  return powers;
}

void
set_power_global_activity(float activity,
			  float duty)
{
  Power *power = Sta::sta()->power();
  power->setGlobalActivity(activity, duty);
}

void
set_power_input_activity(float activity,
			 float duty)
{
  Power *power = Sta::sta()->power();
  return power->setInputActivity(activity, duty);
}

void
set_power_input_port_activity(const Port *input_port,
			      float activity,
			      float duty)
{
  Power *power = Sta::sta()->power();
  return power->setInputPortActivity(input_port, activity, duty);
}

void
set_power_pin_activity(const Pin *pin,
		       float activity,
		       float duty)
{
  Power *power = Sta::sta()->power();
  return power->setUserActivity(pin, activity, duty, PwrActivityOrigin::user);
}

float
clock_min_period()
{
  Power *power = Sta::sta()->power();
  return power->clockMinPeriod();
}

InstanceSeq
highest_power_instances(size_t count,
                        const Corner *corner)
{
  Power *power = Sta::sta()->power();
  return power->highestPowerInstances(count, corner);
}

////////////////////////////////////////////////////////////////

void
read_vcd_file(const char *filename,
              const char *scope)
{
  Sta *sta = Sta::sta();
  sta->ensureLibLinked();
  readVcdActivities(filename, scope, sta);
}

////////////////////////////////////////////////////////////////

bool
read_saif_file(const char *filename,
               const char *scope)
{
  Sta *sta = Sta::sta();
  sta->ensureLibLinked();
  return readSaif(filename, scope, sta);
}

void
report_activity_annotation_cmd(bool report_unannotated,
                               bool report_annotated)
{
  Power *power = Sta::sta()->power();
  power->reportActivityAnnotation(report_unannotated,
                                  report_annotated);
}

%} // inline
