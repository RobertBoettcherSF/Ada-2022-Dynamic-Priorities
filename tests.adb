pragma Ada_2022;
with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Dynamic_Priorities_Demo;
procedure Tests is
begin
   Assert (Dynamic_Priorities_Demo.Priority_Change_Visible);
   Put_Line ("PASS Dynamic_Priorities Set/Get_Priority");
   Put_Line ("All Dynamic_Priorities topic tests passed.");
end Tests;
