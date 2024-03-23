namespace StudentManager
{
    internal class Program
    {
        static void Main(string[] args)
        {
            PlayWithValueTypeArrayV1();
            PlayWithValueTypeArrayV2();
        }

        static void PlayWithValueTypeArrayV1()
        {
            //bàn về biến/ value mà tốn 1 vùng ram: int, long, float
            //Yêu cầu: Hãy lưu 10 số nguyên và tính tổng của chúng

            //ANSWER 1: DÙNG KHAI BÁO BIẾN LẺ NHƯ TRUYỀN THỐNG
            //khai báo lẻ
            int a1 = 1, a2 = 2, a3 = 3, a4 = 4, a5 = 1, a = 2, b = 3, c = 4, d = 45, e = 87;

            int sum = a1 + a2 + a3 + a4 + a5 + a + b + c + d + e;
            //HỆ QUẢ: khó quản lý nếu dữ liệu nhiều, dài, không kết hợp được cấu trúc, dễ bị lặp,..

            //ANSWER 2: DÙNG ARRAY
            //Mảng là kỹ thuật khai báo nhiều biến cùng một lúc và 
            //các biến phải cùng kiểu, cùng tên, nằm liên tiếp nhau trong ram
            //để phân biệt mỗi biến, dùng số thứ tự của mỗi biến đếm từ 0
            //khai báo sỉ
            int[] arr = new int[10];
            //do có một vùng new đã được dành ra => sinh ra object

            arr[0] = 5;
            arr[1] = 10;
            arr[2] = 15;
            arr[3] = 20;
            arr[4] = 30;
            arr[5] = 40;
            //biến không gán giá trị trong mảng defaul = 0
            
            //vừa khai báo mảng vừa khai báo biến (object initializers)
            //PlayWithValueTypeArrayV2()

            Console.WriteLine("The array's length (get the variable arrayLength): \t" + arr.Length);


            Console.WriteLine($"The array's GetLength(dimention) (return int): \t" +
                                $"{arr.GetLength(0)} ");
            //In kết quả
            Console.WriteLine("The array has the value of: ");
            Console.WriteLine(arr[0] + " " + arr[1] + " " + arr[2] + " "
                            + arr[3] + " " + arr[4] + " " + arr[5] + " "
                            + arr[6] + " " + arr[7] + " " + arr[8] + " "
                            + arr[9]);

            Console.WriteLine("The array is printed by using traditional for loop: ");
            for (int i = 0; i < arr.Length; i++)    //i khai báo ở đây mang ý nghĩa siêu local, biến siêu cục bộ chỉ dùng ở trong mảng FOR
                                                    //đây là kiểu viết mới để kiểm soát biến i, tránh việc biến bị thay đổi giá trị lung tung.
                                                    //vì sau khi kết thúc vòng For thì biến i sẽ được reset lại
                                                    //một số tool sẽ phải vào cài đặt lại cấu hình để sử dụng cách khai báo này??
            {
                Console.Write(arr[i] + " ");
                Console.Write($"{arr[i]} ");
            }

            

            //HIỆU QUẢ: khai báo nhanh, dễ quản lý tính toán bằng cách dùng vòng FOR
            for (int i = 0; i < arr.Length; i++)
            {
                sum += arr[i];
            }
            //HỆ QUẢ: cách phân biệt tên biến phức tạp (dùng chỉ mục - index và gắn với mảng)
            //vẫn phải gán value cho từng biến

            //ANSWER 3: DÙNG COLLECTION: ARRAYLIST, LIST, MAP, SET,...
            
        }

        static void PlayWithValueTypeArrayV2()
        {
            //(object initializers)
            //kỹ thuật khai báo mảng style 2, vẫn cùng kết quả,vẫn xử lý như nhau, chỉ khác cách gán giá trị
            int[] arr = { 5, 10, 15, 20, 30, 40};
            //new

            //int[] arr = {     5,      10,     15,     20,     30,     40 };
            //                arr[0], arr[1],  arr[2]
            //HỆ QUẢ: Mảng bị fix số phần tử, không thể add thêm linh hoạt
            //thuận lợi là dễ viết

            //In mảng:
            Console.WriteLine("The array is printed by using traditional for loop:");
            for(int i = 0;i < arr.Length;i++)
            {
                Console.Write($"{arr[i]}  ");
            }
        }
    }
}
