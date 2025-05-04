//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Threading.Tasks;
//using Microsoft.AspNetCore.Mvc;
//using Microsoft.AspNetCore.Mvc.Rendering;
//using Microsoft.EntityFrameworkCore;
//using WebsitePhoto.Models;

//namespace WebsitePhoto.Controllers
//{
//    public class ProductController : Controller
//    {
//        private readonly PhotodbContext _context;

//        public ProductController(PhotodbContext context)
//        {
//            _context = context;
//        }

//        public IActionResult FeaturedProducts()
//        {
//            var products = _context.Products.ToList(); // Truy vấn tất cả sản phẩm từ cơ sở dữ liệu
//            return View(products);
//        }
//    }

//}
