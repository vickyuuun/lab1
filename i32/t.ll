; main.ll
target triple = "x86_64-unknown-linux-gnu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
@.str = private unnamed_addr constant [20 x i8] c"The average is: %d\0A\00"
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

@.strf1 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.strf = private unnamed_addr constant [21 x i8] c"The float is: %.6lf\0A\00", align 1

define i32 @s_average(i32* %student_ptr){

    %sum=alloca i32, align 4
    
    store i32 0,i32* %sum,align 4
    
    %i=alloca i32,align 4
    
    store i32 0,i32* %i,align 4  
   
    br label %start
    
    
    start:
        %1=load i32 ,i32* %sum ;;sum
    
        %2=load i32,i32* %i,align 4  ; i *
        
        %3=icmp slt i32 %2,3
        
        br i1 %3,label %A,label %B
        
    A:
        %4=alloca i32,align 4 ;;score
        
        %5 = getelementptr inbounds i32 , i32* %student_ptr, i32 %2 ;;;

        %6=load i32,i32* %5,align 4 ;;==>score
        
        store i32 %6,i32* %4,align 4 ;;;%4  ==>* score
       
        %mid_1 = add nsw i32 %1, %6  ;;mid_sum
        
        store i32 %mid_1,i32* %sum,align 4
        
        %mid_2=add nsw i32 %2,1  ;;i++
        
        store i32 %mid_2,i32* %i,align 4
       ; %call_4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i32 %mid_1)
        
        br label %start
        
    B:
        %7=alloca i32,align 4
        
        %mid_7=udiv i32 %1, 3 ;udiv
        
        store i32 %mid_7,i32* %7
        
        %end_7=load i32,i32* %7
        
        %call_5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i32 %end_7)
        
        ret i32 %end_7 
                
}




define i32 @main() {
     
    %fir=alloca [3 x i32]
    
    
    %z_1= getelementptr inbounds [3 x i32], [3 x i32]* %fir, i32 0, i32 0
    
    %z_2= getelementptr inbounds [3 x i32], [3 x i32]* %fir, i32 0, i32 1
    
    %z_3= getelementptr inbounds [3 x i32], [3 x i32]* %fir, i32 0, i32 2

    %zer_1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str1, i64 0, i64 0), i32* %z_1)
    
    %zer_2 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str1, i64 0, i64 0), i32* %z_2)
    
    %zer_3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str1, i64 0, i64 0), i32* %z_3)
    
   
    %q_1=load i32,i32*%z_2
   
    %c_all = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i32 %q_1)
   
    %ptr_temp = getelementptr inbounds [3 x i32], [3 x i32]* %fir, i32 0, i32 0

    %mid_8 = call i32 @s_average(i32* %ptr_temp)
    
    
    
    %mid_9 = icmp slt i32 %mid_8, 2 
    
    br i1 %mid_9,label %C,label %D
    
    C:
       %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i32 1)
      ret i32 0
      
    D:
      %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i32 11)
      ret i32 1

}

declare dso_local i32 @__isoc99_scanf(i8*, ...)

declare dso_local i32 @printf(i8*, ...)
