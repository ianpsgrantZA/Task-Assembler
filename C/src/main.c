#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* create_memory(char* input_string) {
    char *p = (char*) malloc(101 * sizeof(char));
    strncpy (p, input_string, 101);
}

int main() {
    char input_string[100];
    char* tasks[50];
    int count = 0;
    printf("--------------------------\n");
    printf("Welcome to TaskManager!\n");
    printf("--------------------------\n");
    printf("~You can exit by entering a blank task~\n\n");
    printf("Enter a task: ");

    fgets(input_string, sizeof input_string, stdin);

    // new line char
    while(input_string[0] != 0xA){
        char* task = create_memory(input_string);
        tasks[count] = task;
        count++;

        printf("\nYou have the following tasks:\n\n");
        for (int i = 0; i < count; i++) {
            printf("* %s",tasks[i]);
        }

        printf( "Enter a new task: ");
        fgets(input_string, sizeof input_string, stdin);
    }

    // free memory
    for (int i = 0; i < count; i++) {
        free(tasks[i]);
    }
    
    return 0;
}
