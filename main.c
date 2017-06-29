#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define N 100


typedef struct studentGrade{
    int sId;
    char sName[20];
    float sGradeC;
    float sGradeM;
    float sGradeE;
    float sumGrade;
}stu;


int mainMenu();
void mymenu();
int insertGrade(stu stu[], int n);
int searchGrade(stu stu[], int n);
int updateGrade(stu stu[],int n);
int updateThings(stu stu[], int n);
int deleteGrade(stu stu[], int n);
int deteleThings(stu stu[], int n, int sId);
int sortGrade(stu stu[], int n);
int printSortMenu();
int popSort(stu stu[], int n, int type, int sortType);
int fileWrite();
int fileRead();
void printAllGrade(stu stu[], int n );
void printGrade(stu stu[], int i);


stu students[N];
int count = 0;

int main()
{
    fileRead();
    mainMenu();
    return 0;
}


int mainMenu(){
    int choice;
    while(1){
    mymenu();
    printf("Please input your choice:");

    scanf("%d", &choice);
    switch(choice){
    case 1:
        insertGrade(students, count);
        break;
    case 2:
        searchGrade(students, count);
        break;
    case 3:
        updateGrade(students, count);
        break;
    case 4:
        deleteGrade(students, count);
        break;
    case 5:
        printAllGrade(students, count );
        break;
    case 6:
        sortGrade(students, count);
        break;
    case 7:
        fileWrite();
        exit(0);
        break;
    default:
        printf("your choice is error!\n");

     }
    }
    return 0;
}

void mymenu(){
 printf("\n");
 printf("*1.Add grades info for a student\n");
 printf("*2.Search Grades info for a student\n");
 printf("*3.Alter Grades info for a student\n");
 printf("*4.Delete Grades info for a student\n");
 printf("*5.Print Grades info for all students\n");
 printf("*6.Sort Grades info for all students\n");
 printf("*7.Saving students grades info and exiting\n");
 printf("\n");
}

int insertGrade(stu stu[], int n){
    int i,sIdTmp,flag = 1;
    char YON;
    char sNameTmp[20];
    float sGradeC,sGradeM,sGradeE;
    if(count == 0){
    printf("\nPlease input student ID:");
    scanf("%d",&sIdTmp);
    }else{
    while(flag){
    printf("\nPlease input student ID:");
    scanf("%d",&sIdTmp);
    flag =0;
    for(i=0;i<n;i++){
        if(stu[i].sId == sIdTmp){
            printf("This student exists\n");
            flag = 1;
                }
            }
        }
    }
    printf("\nPlease input student Name:");
    scanf("%s",sNameTmp);
    printf("\nPlease input C Grades:");
    scanf("%f",&sGradeC);
    printf("\nPlease input Math Grades:");
    scanf("%f",&sGradeM);
    printf("\nPlease input English Grades:");
    scanf("%f",&sGradeE);
    printf("\nAre you sure to add?(y/n)");
    fflush(stdin);
    scanf("%c",&YON);
    if(YON == 'y'){
    stu[n].sId = sIdTmp;
    strcpy(stu[n].sName,sNameTmp);
    stu[n].sGradeC = sGradeC;
    stu[n].sGradeM = sGradeM;
    stu[n].sGradeE = sGradeE;
    stu[n].sumGrade = sGradeC + sGradeM + sGradeE;
    count +=1;
    printf("This record is added\n");
    }else{
        printf("You undoed the add operation!\n");
    }
    return 0;
}

int searchGrade(stu stu[], int n){
    int i,sId,quitFlag = 1;
    if(n == 0){
        printf("\nNo student info can search!\n");
        return -1;
    }
    while(quitFlag){
    printf("\nPlease input student ID:");
    scanf("%d",&sId);
    quitFlag = 1;
    for( i=0;i<n;i++){
    if(stu[i].sId == sId){
        printGrade(stu,i);
        quitFlag = 0;
        break;
            }
        }
        if(quitFlag == 1){
        printf("No student finded, please input a student ID agian!\n");
        break;
        }
    }
    mainMenu();
    return 0;
}

int updateGrade(stu stu[],int n){
    int i,sId;
    if(n == 0){
        printf("\nNo student can update\n");
        return -1;
    }
    printf("\nPlease input student ID:");
    scanf("%d",&sId);
    for ( i=0;i<n;i++){
        if(stu[i].sId == sId){
            printf("this student is already finded!\n");
            updateThings(stu, i);
        }else {
        printf("No student info can be finded\n");
        }
    }
    mainMenu();
    return 0;
}

int updateThings(stu stu[], int n){ //n带表某个学生
    char YON;
    char sNameTmp[20];
    float sGradeC,sGradeM,sGradeE;
    printf("\nPlease input student ID:");
    scanf("%s",sNameTmp);
    printf("\nPlease input C Grades:");
    scanf("%f",&sGradeC);
    printf("\nPlease input Math Grades:");
    scanf("%f",&sGradeM);
    printf("\nPlease input English Grades:");
    scanf("%f",&sGradeE);
    printf("\nThe fllowing info will be alter:");
    printGrade(stu, n);
    printf("\nare you sure to alter it ?(y/n)");
    fflush(stdin);
    scanf("%c",&YON);
    if(YON == 'y'){
    strcpy(stu[n].sName,sNameTmp);
    stu[n].sGradeC = sGradeC;
    stu[n].sGradeM = sGradeM;
    stu[n].sGradeE = sGradeE;
    stu[n].sumGrade = sGradeC + sGradeM + sGradeE;
    printf("\nThis record  is altered !\n");
    }else{
        printf("\nYou quit this alter operation!\n");
    }
    return 0;
}
int deleteGrade(stu stu[], int n){
    int i,sId;
    char YON;
    if(count == 0){
        printf("\nNo students info can delete\n");
        return -1;
    }
    printf("\nPlease input student ID what you want to delete:");
    scanf("%d",&sId);
    for ( i=0;i<n;i++){
        if(stu[i].sId == sId){
            printf(" The fllowing info will be deleted:\n");
            printGrade(stu, i);
            printf("\nAre you sure to delete?(y/n)");
            fflush(stdin);
            scanf("%c",&YON);
            if(YON == 'y'){
            deteleThings(stu, i,sId);
            }else{
                printf("You quit this delete operation\n");
            }
        }else {
        printf("\nNo student info can be finded!\n");
        };
    }
    mainMenu();
    return 0;
}

int deteleThings(stu stu[], int n, int sId){
    int i;
    for( i=n-1;i<count;i++){
    stu[i]=stu[i+1];
    }
    count -= 1;
    printf("Student ID is %d has been deleted!\n",sId);
    return 0;
}

int sortGrade(stu stu[], int n){
    if(n == 0){
        printf("\nNo student can sort!\n");
        return -1;
    }
    int choice =  printSortMenu();
    switch(choice){
        case 1:
            popSort(stu,n,1,1);
            break;
        case 2:
            popSort(stu,n,1,2);
            break;
        case 3:
            popSort(stu,n,2,1);
            break;
        case 4:
            popSort(stu,n,2,2);
            break;
        case 5:
            popSort(stu,n,3,1);
            break;
        case 6:
            popSort(stu,n,3,2);
            break;
        case 7:
            popSort(stu,n,4,1);
            break;
        case 8:
            popSort(stu,n,4,2);
            break;
        case 9:
            mainMenu();
            break;
        default:
            printf("Input error,please input a menu choice again!\n");
            break;
    }
    mainMenu();
    return 0;
}

int printSortMenu(){
    int choice;
    printf("\n");
    printf("*1.Sort by C Grades ASC \n");
    printf("*2.Sort by C Grades DESC \n");
    printf("*3.Sort by Math Grades ASC \n");
    printf("*4.Sort by Math Grades DESC\n");
    printf("*5.Sort by English Grades ASC \n");
    printf("*6.Sort by English Grades DESC\n");
    printf("*7.Sort by sum Grades ASC \n");
    printf("*8.Sort by sum Grades DESC\n");
    printf("*9.return main menu!\n");
    printf("\n");
    printf("Please input your sort choice:");
    scanf("%d",&choice);
    return choice;
}


int popSort(stu stu[], int n, int type, int sortType){
    struct studentGrade tmpStu;
    float tmpGrade,tmpGrade2;
    int i,j,flag = 1;
    for(i=0; i<n-1; i++){
        for(j = i+1; j<n;j++){
            if (type == 1){
                tmpGrade=stu[i].sGradeC;
                tmpGrade2=stu[j].sGradeC;
            }else if(type == 2){
                tmpGrade=stu[i].sGradeM;
                tmpGrade2=stu[j].sGradeM;
            }else if(type ==3){
                tmpGrade=stu[i].sGradeE;
                tmpGrade2=stu[j].sGradeE;
            }else if(type ==4){
                tmpGrade=stu[i].sumGrade;
                tmpGrade2=stu[j].sumGrade;
            }
            if (sortType == 1){
            if(tmpGrade > tmpGrade2){
                tmpStu = stu[j];
                stu[j] = stu[i];
                stu[i] = tmpStu;
                flag = 0;
            }
            }else if(sortType ==2){
                if(tmpGrade < tmpGrade2){
                tmpStu = stu[j];
                stu[j] = stu[i];
                stu[i] = tmpStu;
                flag = 0;
                    }
                }
            }
        if(flag){
        break;
            }
        }
    printAllGrade(stu, n);
    return 0;
}

int fileWrite(){
    FILE *fp;
    int i;
    if((fp = fopen("test.txt","wb")) == NULL){
        printf("\nCan't open this file!\n");
        return -1;
    }
    if (fwrite(&count,sizeof(int),1,fp) !=1){
        printf("\nWriten file error!\n");
        return -1;
    }
    for (i=0;i<count;i++){
    if (fwrite(&students[i],sizeof(stu),1,fp) !=1){
        printf("\nWriten file error!\n");
        return -1;
        }
    }
    fclose(fp);
    return 0;
}

int fileRead(){
    FILE *fp;
    int i;
    if((fp = fopen("test.txt","r")) == NULL){
    printf("fileRead error,No such this file!\n");
    return -1;
    }
    if (fread(&count,sizeof(int),1,fp) != 1){
        count = -1;
    }else{
        for(i=0;i<count;i++){
            fread(&students[i],sizeof(stu),1,fp);
        }
    }
    fclose(fp);
    return 0;
}

void printAllGrade(stu stu[], int n ){
    int i;
    if(n == 0){
        printf("\nNo student info can display!\n");
    }
    for (i=0;i<n;i++){
        printGrade(stu, i);
    }

}

void printGrade(stu stu[], int i){
printf("\nStuId: %d, StuName: %s, CGrades: %.2f, MGrades: %.2f, EGrades: %.2f, SumGrades: %.2f\n",
        stu[i].sId,stu[i].sName, stu[i].sGradeC, stu[i].sGradeM, stu[i].sGradeE,stu[i].sumGrade);

}
