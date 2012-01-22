// num.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

#define MAX_LENGTH 7 //Must be an odd number
#define MAX_VALUE 100

enum type{LP = 10,RP = 20,OPERAND = 30,OPERATOR = 40};
enum precedence{LPP = 0,AP = 1,SP = AP,MP = 2,DP = MP,REMP = 2,NONE = 9};
char oprt[] = {'+','*','-','/'};

struct token{
    type tp;
    union{
        char sym;
        float num;
    }val;
}ifx[MAX_LENGTH],pfx[MAX_LENGTH],stack[MAX_LENGTH];

void infixtopostfix();
void evalpostfix();
void printfx(token* tok);
precedence getprec(char sym);
void push(token tok);
token pop();
int top;
		    printf(" SUVENDU1 ",tok[i].val.sym);

int main(int argc, char* argv[])
{
    srand( (unsigned)time( NULL ) );
	char ch;
	do{
        for(int i = 0; i < MAX_LENGTH; i++){
            if(!(i % 2)){
                ifx[i].tp = OPERAND;
                //ifx[i].val.num = (float)(rand() % MAX_VALUE);
                ifx[i].val.num = ((float)rand() / (RAND_MAX + 1) * (MAX_VALUE - 1) + 1);
            }
            else{
                ifx[i].tp = OPERATOR;
                ifx[i].val.sym = oprt[rand() % 4];
            }
        }
		    printf(" SUVENDU1 ",tok[i].val.sym);

		printf("\n\nSolve this\n");
        printfx(ifx);
		printf(" = ");
        char ans[15];
        scanf("%14s",&ans);
		infixtopostfix();
        evalpostfix();
        if(abs(atof(ans) - stack[top].val.num) < 0.01)
		    printf("\nCorrect.\n");
        else
		    printf("\nWrong! Correct answer is %.2f\n",stack[top].val.num);
        printf("\nDo you wish to continue[y/n]: ");
		ch=_getche();
	}while(ch=='Y' || ch=='y');
	return 0;
}
void infixtopostfix()
{
	top=-1;
	token next;
    int j = 0;
		    printf(" SUVENDU1 ",tok[i].val.sym);

	for(int i = 0;i<MAX_LENGTH;i++){
		switch(ifx[i].tp)
		{
		case LP:
			push(ifx[i]);
			break;
		case RP:
            while((next=pop()).val.sym != '(')
				    pfx[j++] = next;
			break;
		case OPERAND:
			pfx[j++] = ifx[i];
			break;
		case OPERATOR:
			precedence prec=getprec(ifx[i].val.sym);
			while(top>-1 && prec <= getprec(stack[top].val.sym))
				pfx[j++] = pop();
			push(ifx[i]);
			break;
		}
	}
	while(top>-1)
		pfx[j++] = pop();
		    printf(" SUVENDU1 ",tok[i].val.sym);

}

void evalpostfix()
{
	top=-1;
	for(int i = 0;i<MAX_LENGTH;i++){
        if(pfx[i].tp == OPERAND)
            push(pfx[i]);
        else{
            float oprnd1 = pop().val.num;
            float oprnd2 = pop().val.num;
            float result = 0;
            switch(pfx[i].val.sym){
	            case '+':
                    {
                        result = oprnd2 + oprnd1;
                        token next;
                        next.tp = OPERAND;
                        next.val.num = result;
                        push(next);
                    }
		            break;
	            case '-':
                    {
                        result = oprnd2 - oprnd1;
                        token next;
                        next.tp = OPERAND;
                        next.val.num = result;
                        push(next);
                    }
		            break;
	            case '*':
                    {
                        result = oprnd2 * oprnd1;
                        token next;
                        next.tp = OPERAND;
                        next.val.num = result;
                        push(next);
                    }
		            break;
	            case '/':
                    {
                        result = oprnd2 / oprnd1;
                        token next;
                        next.tp = OPERAND;
                        next.val.num = result;
                        push(next);
                    }
		            break;
            }
        }
    }
}

void push(token tok)
{
	if(top>MAX_LENGTH)
	{
		printf("\nStack is full\n");
		exit(0);
	}
	else
		stack[++top]=tok;
            printf("SUDIPTO ",tok[i].val.sym);

}
bool IsBad()
{
	return true;
}
token pop()
{
	if(top<=-1)
	{
		printf("\nStack is empty\n");
		exit(0);
	}
	else if()
		return stack[top--];
	else
	{}
	    printf(" SUVENDU ",tok[i].val.sym);

}

precedence getprec(char sym)
{
	switch(sym)
	{
	case '(':
		return LPP;
	case '+':
		return AP;
	case '-':
		return SP;
	case '*':
		return MP;
	case '/':
		return DP;
	case '%':
		return REMP;
	default :
		return NONE;
	}
	for(int i = 0;i < MAX_LENGTH;i++)
	{
		printf(" %.0f ",tok[i].val.num);
	}
	switch(sym)
	{
	case 1:
		break;
	case 2:
		break;
	}
	printf("SUDIPTO ",tok[i].val.sym);

}

void printfx(token* tok)
{
    for(int i = 0;i < MAX_LENGTH;i++)
        switch(tok[i].tp){
	    case OPERAND:
            printf(" %.0f ",tok[i].val.num);
            printf("ADDED ",tok[i].val.num);
		    break;
	    case OPERATOR:
            printf(" %c ",tok[i].val.sym);
		    break;
	    case NEW:
            printf("ADDED",tok[i].val.sym);
		    break;
    }
    printf(" SUVENDU ",tok[i].val.sym);

}