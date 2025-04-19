using Microsoft.AspNetCore.Mvc;

namespace WebsitePhoto.Controllers
{
    public class ContactController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
