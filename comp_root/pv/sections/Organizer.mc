%#============================================================================
%# ePortal - WEB Based daily organizer
%# Author - S.Rusakov <rusakov_sa@users.sourceforge.net>
%#
%# Copyright (c) 2000-2003 Sergey Rusakov.  All rights reserved.
%# This program is free software; you can redistribute it
%# and/or modify it under the same terms as Perl itself.
%#
%#
%#----------------------------------------------------------------------------
%# Today's calendar section
%#-----------------------------------------------------------------------------
<%perl>
  my $app = $ePortal->Application('Organizer');

  if (! $ePortal->username) {
      $m->comp("/pv/sections/Organizer.mc:user_not_registered");
      return;
  }

</%perl>

<ul>
  <li><a href="/Organizer/cal_dairy.htm" class="smallfont"><%
    pick_lang(rus => "����������", eng => "Dairy") %></a>
  <li><a href="/Organizer/todo_list.htm" class="smallfont"><%
    pick_lang(rus => "���� � ������", eng => "Tasks") %></a>
  <li><a href="/Organizer/cont_list.htm" class="smallfont"><%
    pick_lang(rus => "������ � ��������", eng => "Contacts") %></a>
  <li><a href="/Organizer/memo_list.htm" class="smallfont"><%
    pick_lang(rus => "�������", eng => "Memos") %></a>
  <li><a href="/Organizer/ann_list.htm" class="smallfont"><%
    pick_lang(rus => "���������", eng => "Anniversaries") %></a>
</ul>


%#=== @METAGS user_not_registered ====================================================
<%method user_not_registered>
<span class="smallfont">
���� ������ ����� ����� ������ ��� <a href="/login.htm" target="_top">������������������</a> �������������
<br>
You are not <a href="/login.htm" target="_top">registered</a> user.
</span>
</%method>


%#=== @metags attr =========================================================
<%attr>
def_title => { rus => "��� ����������", eng => "My Organizer"}
def_params => ""
def_url => "/Organizer/index.htm"
def_width => 'N',
</%attr>

