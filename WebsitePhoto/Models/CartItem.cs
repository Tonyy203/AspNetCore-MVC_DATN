namespace WebsitePhoto.Models
{
    public class CartItem
    {
        public int CartItemId { get; set; }
        public int ProductId { get; set; }  // ID của sản phẩm trong giỏ hàng
        public string ProductName { get; set; }  // Tên sản phẩm
        public decimal Price { get; set; }  // Giá của sản phẩm
        public int Quantity { get; set; }  // Số lượng sản phẩm trong giỏ hàng
        public decimal TotalPrice => Price * Quantity;  // Tổng giá của sản phẩm trong giỏ hàng
    }
}
