all: compile

compile: src/*
	rm -rf __MAIN__
	elixirc src/*
