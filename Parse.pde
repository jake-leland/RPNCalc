// Andrew Martz

import java.util.*;
import java.io.*;
import java.lang.*;

public String parse(String in)
{

  Stack<Integer> n = new Stack<Integer>();
  final String SYMBOL = "+-*/";	

  //String s = "2 8 + 8 *";
  String s = in;

  String rtrn = doMath(cutString(s));
  return rtrn;
}
//change to doMath(?)
//continue to pop until a SYMBOL, then put back into a Stack
public Stack<String> cutString(String s)
{
  final String SYMBOL = "+-*/";
  String[] r = s.split(" ");
  Stack<String> e = new Stack<String>();
  Stack<String> n = new Stack<String>();

  for (int i = 0; i < r.length; i++)
  {
    e.push(r[i]);
  }
  while (!e.isEmpty ())
    n.push(e.pop());

  return n;
}


public String doMath(Stack<String> n)
{
  final String SYMBOL = "+-*/";
  Stack<Double> r = new Stack<Double>();
  //change a to an arraylist of ints
  //int a = 0;
  //ArrayList<Integer> a = new ArrayList<Integer>();
  double y = 0;

  boolean noSym = true;
  while (!n.isEmpty ())
  {
    if (!SYMBOL.contains(n.peek()))
      //if(n.peek().length() < 308)
    {
      try
      {
        r.push(Double.parseDouble(n.pop()));
      }
      catch(Exception e)
      {
        return "Error";
      }
    }
    //else
    //  return "Overflow";
    else 
    {
      if (r.size()>=2)
      {
        noSym = false;
        double k = r.pop();
        //a = r.remove();

        if (SYMBOL.indexOf(n.peek()) == 0)
        {
          //a.add(k + r.remove());
          y = r.pop() + k;
        }
        else if (SYMBOL.indexOf(n.peek()) == 1)
        {
          //a.add(k - r.remove());
          y = r.pop() - k;
        }
        else if (SYMBOL.indexOf(n.peek()) == 2)
        {
          //a.add(k * r.remove());
          y = r.pop() * k;
        }
        else if (SYMBOL.indexOf(n.peek()) == 3)					
        {
          //a.add(k / r.remove());
          if (k == 0)
            return "Err Divide by 0";
          y = r.pop() / k;
        }

        r.add(y);

        n.pop();
      }
      else
        return "Error";
    }
  }

  if (noSym || r.size()!=1)
    return "Error";
  //int decimal = r.peek() / round(float(r.peek()));
  //if(decimal = 0)
  return "" + r.pop();
  //else
  //  return "" + round(r.pop());
}

