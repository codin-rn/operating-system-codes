#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>
#include <sys/wait.h>
 
int main(){
        pid_t i;
 
        i=fork();
 
        if (i==0){
        while (1){
                printf("child process pid = %d, ppid=%d\n",(int)getpid(), (int)getppid());
                sleep(3);
        }
 
        }else{
 
                printf("parent has finished");
 
 
        }
        return 0;
}
