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

#include "PortDirection.hh"

#include "StringUtil.hh"

namespace sta {

PortDirection *PortDirection::input_;
PortDirection *PortDirection::output_;
PortDirection *PortDirection::tristate_;
PortDirection *PortDirection::bidirect_;
PortDirection *PortDirection::internal_;
PortDirection *PortDirection::ground_;
PortDirection *PortDirection::power_;
PortDirection *PortDirection::unknown_;

void
PortDirection::init()
{
  input_ = new PortDirection("input", 0);
  output_ = new PortDirection("output", 1);
  tristate_ = new PortDirection("tristate", 2);
  bidirect_ = new PortDirection("bidirect", 3);
  internal_ = new PortDirection("internal", 4);
  ground_ = new PortDirection("ground", 5);
  power_ = new PortDirection("power", 6);
  unknown_ = new PortDirection("unknown", 7);
}

void
PortDirection::destroy()
{
  delete input_;
  input_ = nullptr;
  delete output_;
  output_ = nullptr;
  delete tristate_;
  tristate_ = nullptr;
  delete bidirect_;
  bidirect_ = nullptr;
  delete internal_;
  internal_ = nullptr;
  delete ground_;
  ground_ = nullptr;
  delete power_;
  power_ = nullptr;
  delete unknown_;
  unknown_ = nullptr;
}

PortDirection::PortDirection(const char *name,
			     int index) :
  name_(name),
  index_(index)
{
}

PortDirection *
PortDirection::find(const char *dir_name)
{
  if (stringEqual(dir_name, "input"))
    return input_;
  else if (stringEqual(dir_name, "output"))
    return output_;
  else if (stringEqual(dir_name, "tristate"))
    return tristate_;
  else if (stringEqual(dir_name, "bidirect"))
    return bidirect_;
  else if (stringEqual(dir_name, "internal"))
    return internal_;
  else if (stringEqual(dir_name, "ground"))
    return ground_;
  else if (stringEqual(dir_name, "power"))
    return power_;
  else
    return nullptr;
}

bool
PortDirection::isAnyInput() const
{
  return this == input_
    || this == bidirect_;
}

bool
PortDirection::isAnyOutput() const
{
  return this == output_
    || this == tristate_
    || this == bidirect_;
}

bool
PortDirection::isAnyTristate() const
{
  return this == tristate_
    || this == bidirect_;
}

bool
PortDirection::isPowerGround() const
{
  return this == ground_
    || this == power_;
}

} // namespace
