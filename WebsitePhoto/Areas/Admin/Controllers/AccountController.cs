using Microsoft.AspNetCore.Mvc;
using WebsitePhoto.Areas.Admin.Models;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.Linq;

namespace WebsitePhoto.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AccountController : Controller
    {
        // Danh sách user đăng ký (demo)
        private static List<Register> _users = new List<Register>();

        public IActionResult Login()
        {
            if (HttpContext.Session.GetString("Admin") != null)
                return RedirectToAction("Index", "Home");

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Login(Login model)
        {
            if (ModelState.IsValid)
            {
                var user = _users.FirstOrDefault(x => x.Username == model.Username && x.Password == model.Password);
                if (user != null)
                {
                    HttpContext.Session.SetString("Username", user.Username);
                    return RedirectToAction("Index", "Home");
                }

                ModelState.AddModelError("", "Sai tài khoản hoặc mật khẩu.");
            }

            return View(model);
        }

        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Register(Register model)
        {
            if (ModelState.IsValid)
            {
                if (_users.Any(x => x.Username == model.Username))
                {
                    ModelState.AddModelError("Username", "Tài khoản đã tồn tại.");
                    return View(model);
                }

                _users.Add(model);
                TempData["Success"] = "Đăng ký thành công!";
                return RedirectToAction("Login");
            }

            return View(model);
        }

        public IActionResult Logout()
        {
            // Xóa thông tin phiên người dùng
            HttpContext.Session.Remove("Username");

            // Chuyển hướng về trang đăng nhập
            return RedirectToAction("Login", "Account", new { area = "Admin" });
        }

    }
}
