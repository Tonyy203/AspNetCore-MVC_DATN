using Microsoft.AspNetCore.Mvc;

namespace WebsitePhoto.Controllers
{
    public class AboutController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
