public class Test {

  public static final void main(String... args) {
    System.out.print("is palindrome? ");
    System.out.println(
      Test.isPalindrome(args[0].toCharArray())
    );
  }

  private static boolean isPalindrome(char... word) {
    int left  = 0;
    int right = word.length - 1;

    while (left < right) {
      if (Character.toLowerCase(word[left]) != Character.toLowerCase(word[right])) 
        return false;

      left++;
      right--;
    }

    return true;
  }
}
