public class FactoryClass 
{
	public static Account createAccount()
    {
        Account A = new Account();
        A.Name='test';
        insert A;
        return A;
    }
}