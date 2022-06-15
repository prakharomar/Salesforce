public class CL_Odd_Even 
{
    public Integer num {get;set;}
    public String choice {get;set;}
    public String msg  {get;set;}
    public Integer count ;
    public Integer result {get; set;}
    
    public void calculate()
    {
        if(choice == 'even')
        {
            calculateeven();
            msg ='Sum of even is calculated';
        }
        else if(choice == 'odd')
        {
            calculateodd();
            msg ='Sum of Odd is calculated';
        }
        else
        {
            msg = 'Contact Alien for more info ';
        }
    }
    
    void calculateeven()
    {
        count = 0;
        result = 0;
        while(count < num)
        {
            result = result + count;
            count = count +2 ; 
        }
    }
    
    void calculateodd()
    {
        count = 1;
        result = 0;
        while(count < num)
        {
            result = result + count;
            count = count +2 ; 
        }
    }
}