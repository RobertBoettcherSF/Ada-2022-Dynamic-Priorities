--  Ada 2022 topic: Ada.Dynamic_Priorities.
pragma Ada_2022;
package Dynamic_Priorities_Demo is
   --  Raise a worker task's priority with Set_Priority; True if Get_Priority
   --  reflects the new value.
   function Priority_Change_Visible return Boolean;
end Dynamic_Priorities_Demo;
