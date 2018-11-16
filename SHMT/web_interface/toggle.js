/*
#  Copyright (C) 2002-2016 Amba Kulkarni (ambapradeep@gmail.com)
#
#  This program is free software; you can redistribute it and/or
#  modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later
#  version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/

function toggle() {
 if( document.getElementById("div1").style.display=='' ){
   document.getElementById("div2").style.display = '';
   document.getElementById("div1").style.display = 'none';
   document.getElementById("div3").style.display = 'none';
   document.getElementById("div4").style.display = 'none';
 }else if( document.getElementById("div2").style.display=='' ){
   document.getElementById("div3").style.display = '';
   document.getElementById("div1").style.display = 'none';
   document.getElementById("div2").style.display = 'none';
   document.getElementById("div4").style.display = 'none';
 }else if( document.getElementById("div3").style.display=='' ){
   document.getElementById("div4").style.display = '';
   document.getElementById("div1").style.display = 'none';
   document.getElementById("div2").style.display = 'none';
   document.getElementById("div3").style.display = 'none';
 }else if( document.getElementById("div4").style.display=='' ){
   document.getElementById("div1").style.display = '';
   document.getElementById("div2").style.display = 'none';
   document.getElementById("div3").style.display = 'none';
   document.getElementById("div4").style.display = 'none';
 }
}
