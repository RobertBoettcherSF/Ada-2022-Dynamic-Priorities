pragma Ada_2022;

with Ada.Dynamic_Priorities;
with System;

package body Dynamic_Priorities_Demo is

   package DP renames Ada.Dynamic_Priorities;

   function Priority_Change_Visible return Boolean is
      task Worker is
         entry Ready;
         entry Done;
      end Worker;

      task body Worker is
      begin
         accept Ready;
         accept Done;
      end Worker;

      Orig   : System.Any_Priority;
      Raised : System.Any_Priority;
      After  : System.Any_Priority;
      Ok     : Boolean;
   begin
      Worker.Ready;
      Orig := DP.Get_Priority (Worker'Identity);

      --  Prefer bumping within System.Priority; otherwise drop one step.
      if Orig < System.Any_Priority (System.Priority'Last) then
         Raised := Orig + 1;
      else
         Raised := Orig - 1;
      end if;

      DP.Set_Priority (Raised, Worker'Identity);
      After := DP.Get_Priority (Worker'Identity);
      Ok := After = Raised and then After /= Orig;
      Worker.Done;
      return Ok;
   end Priority_Change_Visible;

end Dynamic_Priorities_Demo;
