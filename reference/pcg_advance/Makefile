CXX    := gcc
CFLAGS := -std=c99 -Wall -Wextra -MMD -MP -I..
TARGET := ./test.exe
OBJS   := \
	./pcg-advance-8.o  ./pcg-output-8.o  ./pcg-rngs-8.o \
	./pcg-advance-16.o ./pcg-output-16.o ./pcg-rngs-16.o \
	./pcg-advance-32.o ./pcg-output-32.o ./pcg-rngs-32.o \
	./pcg-advance-64.o ./pcg-output-64.o ./pcg-rngs-64.o \
	./main.o

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
