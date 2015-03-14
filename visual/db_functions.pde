import java.io.*;
import java.util.*;

HashMap<String, ArrayList<String>> entries = new HashMap<String, ArrayList<String>>();
String dbName;
BufferedReader bfRead;
int numFields = 4;
String[] fields;

//reads file, initialized a list or something
void readFile(String dbName_){
  dbName = dbName_;
  //add try catch
  try{
    bfRead = new BufferedReader(new FileReader(dbName));
    String line;
    
    try{
      while((line = bfRead.readLine())!=null){
        fields = line.split(",");
        ArrayList<String> props = new ArrayList<String>();
        for(int i=1; i<numFields; i++){
          props.add(fields[i]);
        }
        entries.put(fields[0], props);
      }
    }catch(IOException i){
     System.out.println("file cant be read");
    }
  }catch(FileNotFoundException e){
   System.out.println("file nf");
  }
  
}

//finds an appropriate db entry
//super inneficient :(  I don't know what to do
ArrayList<String> search(int lite, int heit, int pirate){
  ArrayList<String> temp = new ArrayList<String>();
  ArrayList<String> results = new  ArrayList<String>();
  temp.add(Integer.toString(lite));
  temp.add(Integer.toString(heit));
  temp.add(Integer.toString(pirate));
  
  if(entries.containsValue(temp)){
    //go through all the entries
    Set<String> keys = entries.keySet();
    Iterator<String> it = keys.iterator();
    while(it.hasNext()){
     String e = it.next();
     ArrayList<String> val = entries.get(e);
     if(val.equals(temp)){
       results.add(e);
     }
    }
  }
  
  return results;
}
