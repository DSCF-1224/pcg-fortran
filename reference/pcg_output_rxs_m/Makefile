CXX    := gcc
CFLAGS := -std=c99 -Wall -Wextra -MMD -MP -I..
TARGET := ./test.exe
OBJS   := ./pcg-output-8.o ./main.o

all: $(TARGET)

clean_compile:
	make clean
	make

clean_run:
	make clean_compile
	make run

$(TARGET): $(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(CFLAGS)

%.o: %.c
	$(CXX) -c $< $(CFLAGS)

%.o: ../%.c
	$(CXX) -c $< $(CFLAGS)

clean:
	rm -f ./*.d
	rm -f ./*.dat
	rm -f ./*.o
	rm -f $(TARGET)

run:
	$(TARGET)
