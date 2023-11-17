public class CL_Greater_Smaller 
{
    public Integer Num1		{get; set;}
	public Integer Num2		{get; set;}
    public Integer Num3		{get; set;}
    public String Choice 	{get; set;}
    public Integer Result	{get; set;}
    public String msg	{get; set;}
    
    public void mainmethod()
    {
        if(Choice== 'GRTR')
        {
            greater();
            msg = 'Greater number is calculated';
        }
        else if(Choice == 'SMLR')
        {
            smaller();
            msg = 'Smaller number is calculated';
        }
        else
        {
            Result = 0 ; 
            msg = 'No number is calculated';
        }
    }
    
    private void greater()
    {
        if(Num1 > Num2 && Num1 >Num3)
            Result = Num1;
        else if(Num2 > Num1 && Num2 >Num3)
            Result = Num2;
        else
            Result = Num3;
    }
    
    private void smaller()
    {
        if(Num1 < Num2 && Num1 <Num3)
            Result = Num1;
        else if(Num2 < Num1 && Num2 <Num3)
            Result = Num2;
        else
            Result = Num3;
    }
}