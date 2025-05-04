using Microsoft.AspNetCore.Mvc;
using WebsitePhoto.Models;

namespace WebsitePhoto.Areas.Admin.Controllers
{
    public class CategoriesController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
