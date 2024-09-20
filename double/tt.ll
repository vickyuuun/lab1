; main.ll
target triple = "x86_64-unknown-linux-gnu"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
@.strf1 = private unnamed_addr constant [4 x i8] c"%lf\00", align 1
@.strf = private unnamed_addr constant [21 x i8] c"The float is: %.6lf\0A\00", align 1

@.str_great = private unnamed_addr constant [6 x i8] c"great\00", align 1
@.str_hard = private unnamed_addr constant [23 x i8] c"you should work harder\00", align 1

define double @s_average(double* %student_ptr){

    %sum=alloca double, align 4
    
    store double 0.00,double* %sum,align 4
    
    %i=alloca i32,align 4
    
    store i32 0,i32* %i,align 4  
   
    br label %start
    
    
    start:
        %1=load double ,double* %sum ;;sum
    
        %2=load i32,i32* %i,align 4  ; i *
        
        %3=icmp slt i32 %2,3
        
        br i1 %3,label %A,label %B
        
    A:
        %4=alloca double,align 4 ;;score
        
        %5 = getelementptr inbounds double , double* %student_ptr, i32 %2 ;;;

        %6=load double,double* %5,align 4 ;;==>score
        
        store double %6,double* %4,align 4 ;;;%4  ==>* score
       
        %mid_1 = fadd  double %1, %6  ;;mid_sum
        
        store double %mid_1,double* %sum,align 4
        
        %mid_2=add nsw i32 %2,1  ;;i++
        
        store i32 %mid_2,i32* %i,align 4
       
        
        br label %start
        
    B:
        %7=alloca double,align 4
        
        %mid_7=fdiv double %1, 3.00 ;udiv
        
        store double %mid_7,double* %7
        
        %end_7=load double,double* %7
        
        %call_5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.strf, i64 0, i64 0), double %end_7)
        
        ret double %end_7 
                
}




define i32 @main() {
     
    %fir=alloca [3 x double]
    
    
    %z_1= getelementptr inbounds [3 x double], [3 x double]* %fir, i32 0, i32 0
    
    %z_2= getelementptr inbounds [3 x double], [3 x double]* %fir, i32 0, i32 1
    
    %z_3= getelementptr inbounds [3 x double], [3 x double]* %fir, i32 0, i32 2

    %zer_1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.strf1, i64 0, i64 0), double* %z_1)
    
    %zer_2 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.strf1, i64 0, i64 0), double* %z_2)
    
    %zer_3 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.strf1, i64 0, i64 0), double* %z_3)
    
   
    %q_1=load double,double* %z_2
   
    ;%c_all = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.strf, i64 0, i64 0), double %q_1)
   
    ;call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.strf, i64 0, i64 0), double %q_1)
   
    %ptr_temp = getelementptr inbounds [3 x double], [3 x double]* %fir, i32 0, i32 0

    %mid_8 = call double @s_average(double* %ptr_temp)
    
   
    
    %mid_9 = fcmp olt double %mid_8, 80.00 
    
    br i1 %mid_9,label %C,label %D
    
    C:
      %call_0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str_hard, i64 0, i64 0))
    
      ret i32 0
      
    D:
      %call_1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str_great, i64 0, i64 0))
    
      ret i32 1

}

declare dso_local i32 @__isoc99_scanf(i8*, ...)

declare dso_local i32 @printf(i8*, ...)

