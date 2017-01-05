
public class MainTest {
	public static void main(String[] args) {
		System.out.println();
	}
	public static boolean isUTF8(byte[] rawtext) {
		   int score = 0;
		   int i, rawtextlen = 0;
		   int goodbytes = 0, asciibytes = 0;
		   // Maybe also use UTF8 Byte Order Mark: EF BB BF
		   // Check to see if characters fit into acceptable ranges
		   rawtextlen = rawtext.length;
		   for (i = 0; i < rawtextlen; i++) {
		    if ((rawtext[i] & (byte) 0x7F) == rawtext[i]) { 
		     // 最高位是0的ASCII字符
		     asciibytes++;
		     // Ignore ASCII, can throw off count
		    } else if (-64 <= rawtext[i] && rawtext[i] <= -33
		      //-0x40~-0x21
		      && // Two bytes
		      i + 1 < rawtextlen && -128 <= rawtext[i + 1]
		      && rawtext[i + 1] <= -65) {
		     goodbytes += 2;
		     i++;
		    } else if (-32 <= rawtext[i]
		      && rawtext[i] <= -17
		      && // Three bytes
		      i + 2 < rawtextlen && -128 <= rawtext[i + 1]
		      && rawtext[i + 1] <= -65 && -128 <= rawtext[i + 2]
		      && rawtext[i + 2] <= -65) {
		     goodbytes += 3;
		     i += 2;
		    }
		   }
		   if (asciibytes == rawtextlen) {
		    return false;
		   }
		   score = 100 * goodbytes / (rawtextlen - asciibytes);
		   // If not above 98, reduce to zero to prevent coincidental matches
		   // Allows for some (few) bad formed sequences
		   if (score > 98) {
		    return true;
		   } else if (score > 95 && goodbytes > 30) {
		    return true;
		   } else {
		    return false;
		   }
	}
		 
		/*另外对于正规的文本文件来说UTF-8的文件开头有3个字节来标识该文本是UTF-8编码
		EF, BB, BF三个字节
		但通常不采用以下这种方案 因为许多文件不标准*/
		public static boolean getByteEncode(byte[] b)
		{
		   if(b != null && b.length>3)
		   {
		    byte utf8[] = {(byte) 0xEF, (byte) 0xBB, (byte) 0xBF};
		    if((b[0] == utf8[0])&&(b[1]==utf8[1])&&(b[2]==utf8[2]))
		     return true;
		   }
		   return false;
		}
}
