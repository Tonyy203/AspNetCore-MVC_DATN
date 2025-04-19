using Microsoft.AspNetCore.Mvc;

namespace WebsitePhoto.Controllers
{
    public class ProductController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
