namespace WebsitePhoto.Models
{
    public class Cart
    {
        public int CartId { get; set; }  // ID giỏ hàng
        public int CustomerId { get; set; }  // ID khách hàng (nếu có thể lưu lại)
        public List<CartItem> Items { get; set; } = new List<CartItem>();  // Danh sách các sản phẩm trong giỏ hàng
        public decimal TotalPrice => Items.Sum(item => item.TotalPrice);  // Tổng giá trị giỏ hàng
    }
}
