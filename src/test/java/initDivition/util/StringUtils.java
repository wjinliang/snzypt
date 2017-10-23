package initDivition.util;

public class StringUtils {
	//
	public static String[] getStrings(String string){
		String[] strings = string.split(",");
		return strings;
		
	}
	public static int[] getInts(String s) {
		 String[] strings = s.split(",");
		 int[] n = new int[strings.length]; 
		 for(int i = 0;i<strings.length;i++){  
		 n[i] = Integer.parseInt(strings[i]);  
		 }  
		 return n; 
	} 
	public static void main(String[] args) {
		String string="1,2,5,6,7";
		System.out.println(string);
		String[] strings = getStrings(string);
		for (int i = 0; i < strings.length; i++) {
			System.out.println(strings[i]+"哈哈");
			
		}
		int[] ints = getInts("1,2,3");
		for (int i = 0; i < ints.length; i++) {
			System.out.println(ints[i]);
		}
		
	}

}
