package com.smartesting.coffeemachine;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

public class CoffeeMachineTest extends TestCase
{
    public CoffeeMachineTest(String testName)
    {
        super( testName );
    }

    public static Test suite()
    {
        return new TestSuite( CoffeeMachineTest.class );
    }

    public void testCoffeeMachine()
    {
        assertTrue( true );
    }
}
