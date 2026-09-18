GNAT:=gnatmake
FLAGS:=-gnatwa -gnat2022
.PHONY: all test clean
all:
	mkdir -p obj bin
	$(GNAT) $(FLAGS) -Pdynamic_priorities_topic.gpr
test: all
	@bin/tests
clean:
	rm -rf obj bin
