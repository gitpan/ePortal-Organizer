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
<%perl>
  my %args = $m->request_args;
  my @AvailableOrg = $session{_app}->AvailableOrganizers;
  my $organizer = $session{_organizer};

#
#=== Default navigator ======================================================
#

my %NAV = (
  title => pick_lang(rus => "����������: ", eng => "Organizer: ") . $organizer->Title,
  description => pick_lang(rus => "� ������� �������� �����������.", eng => "Organizer's home page"),
  url => '/Organizer/index.htm?org_id=#org_id#',
  items => [ qw/dairy todo_list contact_list anniversary_list notepad_list other/ ],

  other => {
    title => pick_lang(rus => "������", eng => "Other"),
    description => pick_lang(rus => "������ ������� ����������� ", eng => "Other sections of Organizer ") . $organizer->Title,
    items => [qw/category_list/],
    depend => [qw/org_id/],
  },
  anniversary_list => {
    title => pick_lang(rus => "���������", eng => "Anniversary"),
    description => pick_lang(rus => "��������� � �������", eng => "Anniversary dates"),
    url => '/Organizer/ann_list.htm?org_id=#org_id#',
    depend => [qw/org_id/],
  },
  contact_list => {
    title => pick_lang(rus => "��������", eng => "Contacts"),
    description => pick_lang(rus => "������ � ��������", eng => "Contacts and addresses"),
    url => '/Organizer/cont_list.htm?org_id=#org_id#',
    depend => [qw/org_id/],
  },
  category_list => {
    title => pick_lang(rus => "���������", eng => "Categories"),
    description => pick_lang(rus => "������ ���������", eng => "Categories list"),
    url => 'category_list.htm?org_id=#org_id#',
    depend => [qw/org_id/],
  },
  notepad_list => {
    title => pick_lang(rus => "�������", eng => "Memos"),
    description => pick_lang(rus => "�������� � ����� ���� �������", eng => "View and search on memos"),
    url => 'memo_list.htm?org_id=#org_id#',
    depend => [qw/org_id/],
  },
  todo_list => {
    title => pick_lang(rus => "����", eng => "Tasks"),
    description => pick_lang(rus => "���� � ������", eng => "Tasks to do"),
    url => 'todo_list.htm?org_id=#org_id#',
    depend => [qw/org_id/],
  },
  dairy => {
    title => pick_lang(rus => "����������", eng => "Dairy"),
    description => pick_lang(rus => "���������� �� ������ ����", eng => "Dairy for every day"),
    url => 'cal_dairy.htm?org_id=#org_id#',
    depend => [qw/org_id/],
  },

  org_id => $session{_org_id},

  %ARGS);
</%perl>

<& /navigator.mc, %NAV &>

% if ( $session{_org_id} and ! $organizer->xacl_check_update ) {
  <div align="center" class="smallfont">
  <font color="red">
  <% pick_lang(rus => "������ ���������� �������� ��� ������ �� ��������",
              eng => "This is read-only Organizer") %>
  </font></div>
% }
