using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using WebsitePhoto.Models;
using System.Linq;
using System.Threading.Tasks;
using System;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication;

namespace WebsitePhoto.Controllers
{
    public class AccountController : Controller
    {
        private readonly PhotodbContext _context;

        public AccountController(PhotodbContext context)
        {
            _context = context;
        }

        public IActionResult Login() => View();

        [HttpPost]
        public async Task<IActionResult> Login(string username, string password)
        {
            var user = _context.TbUsers
                .FirstOrDefault(u => u.UserName == username && u.Password == password && u.Status == true);

            if (user != null)
            {
                // Session (optional)
                HttpContext.Session.SetInt32("UserId", user.Id);
                HttpContext.Session.SetString("UserName", user.UserName ?? "");

                // Đăng nhập bằng cookie
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, user.UserName),
                    new Claim("UserId", user.Id.ToString())
                };

                var identity = new ClaimsIdentity(claims, "MyCookieAuth");
                var principal = new ClaimsPrincipal(identity);

                await HttpContext.SignInAsync("MyCookieAuth", principal);

                return RedirectToAction("Index", "Home");
            }

            ViewBag.Error = "Tên đăng nhập hoặc mật khẩu không đúng";
            return View();
        }

        public IActionResult Register() => View();

        [HttpPost]
        public async Task<IActionResult> Register(TbUser user)
        {
            if (ModelState.IsValid)
            {
                user.CreatedDate = DateTime.Now;
                user.Status = true;
                _context.TbUsers.Add(user);
                await _context.SaveChangesAsync();
                return RedirectToAction("Login");
            }
            return View(user);
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync("MyCookieAuth");
            HttpContext.Session.Clear();
            return RedirectToAction("Login");
        }

        public IActionResult Profile()
        {
            var userId = HttpContext.Session.GetInt32("UserId");
            if (userId == null) return RedirectToAction("Login");

            var user = _context.TbUsers.FirstOrDefault(u => u.Id == userId);
            return View(user);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditProfile(TbUser user)
        {
            if (ModelState.IsValid)
            {
                var existingUser = await _context.TbUsers.FirstOrDefaultAsync(u => u.Id == user.Id);
                if (existingUser != null)
                {
                    existingUser.UserName = user.UserName;
                    existingUser.Email = user.Email;
                    _context.Update(existingUser);
                    await _context.SaveChangesAsync();
                    return RedirectToAction("Profile");
                }
            }
            return View(user);
        }

        public IActionResult ChangePassword() => View();

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ChangePassword(string currentPassword, string newPassword, string confirmPassword)
        {
            var userId = HttpContext.Session.GetInt32("UserId");
            if (userId == null) return RedirectToAction("Login");

            var user = _context.TbUsers.FirstOrDefault(u => u.Id == userId);
            if (user == null) return NotFound();

            if (user.Password != currentPassword)
            {
                ViewBag.Error = "Mật khẩu hiện tại không chính xác.";
                return View();
            }

            if (newPassword != confirmPassword)
            {
                ViewBag.Error = "Mật khẩu mới và xác nhận không khớp.";
                return View();
            }

            user.Password = newPassword;
            _context.Update(user);
            await _context.SaveChangesAsync();

            return RedirectToAction("Profile");
        }
    }
}
