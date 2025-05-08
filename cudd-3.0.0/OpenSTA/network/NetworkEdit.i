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

%module NetworkEdit

%{
using sta::Cell;
using sta::Instance;
using sta::Net;
using sta::Port;
using sta::Pin;
using sta::NetworkEdit;

%}

////////////////////////////////////////////////////////////////
//
// C++ functions visible as TCL functions.
//
////////////////////////////////////////////////////////////////

%inline %{

Instance *
make_instance_cmd(const char *name,
		  LibertyCell *cell,
		  Instance *parent)
{
  return Sta::sta()->makeInstance(name, cell, parent);
}

void
delete_instance_cmd(Instance *inst)
{
  Sta::sta()->deleteInstance(inst);
}

void
replace_cell_cmd(Instance *inst,
		 LibertyCell *to_cell)
{
  Sta::sta()->replaceCell(inst, to_cell);
}

Net *
make_net_cmd(const char *name,
	     Instance *parent)
{
  return Sta::sta()->makeNet(name, parent);
}

void
make_port_pin_cmd(const char *port_name,
                  PortDirection *dir)
{
  Sta::sta()->makePortPin(port_name, dir);
}

void
delete_net_cmd(Net *net)
{
  Sta::sta()->deleteNet(net);
}

void
connect_pin_cmd(Instance *inst,
		Port *port,
		Net *net)
{
  Sta::sta()->connectPin(inst, port, net);
}

void
disconnect_pin_cmd(Pin *pin)
{
  Sta::sta()->disconnectPin(pin);
}

// Notify STA of network change.
void
network_changed()
{
  Sta::sta()->networkChanged();
}

%} // inline
