using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using WebsitePhoto.Models;

namespace WebsitePhoto.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class OrderDetailsController : Controller
    {
        private readonly PhotodbContext _context;

        public OrderDetailsController(PhotodbContext context)
        {
            _context = context;
        }

        // GET: Admin/OrderDetails
        public async Task<IActionResult> Index()
        {
            return View(await _context.TbOrderDetails.ToListAsync());
        }

        // GET: Admin/OrderDetails/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbOrderDetail = await _context.TbOrderDetails
                .FirstOrDefaultAsync(m => m.OrderId == id);
            if (tbOrderDetail == null)
            {
                return NotFound();
            }

            return View(tbOrderDetail);
        }

        // GET: Admin/OrderDetails/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/OrderDetails/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("OrderId,ProductId,ProductName,Price,Quantity")] TbOrderDetail tbOrderDetail)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tbOrderDetail);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(tbOrderDetail);
        }

        // GET: Admin/OrderDetails/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbOrderDetail = await _context.TbOrderDetails.FindAsync(id);
            if (tbOrderDetail == null)
            {
                return NotFound();
            }
            return View(tbOrderDetail);
        }

        // POST: Admin/OrderDetails/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("OrderId,ProductId,ProductName,Price,Quantity")] TbOrderDetail tbOrderDetail)
        {
            if (id != tbOrderDetail.OrderId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tbOrderDetail);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TbOrderDetailExists(tbOrderDetail.OrderId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(tbOrderDetail);
        }

        // GET: Admin/OrderDetails/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbOrderDetail = await _context.TbOrderDetails
                .FirstOrDefaultAsync(m => m.OrderId == id);
            if (tbOrderDetail == null)
            {
                return NotFound();
            }

            return View(tbOrderDetail);
        }

        // POST: Admin/OrderDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var tbOrderDetail = await _context.TbOrderDetails.FindAsync(id);
            if (tbOrderDetail != null)
            {
                _context.TbOrderDetails.Remove(tbOrderDetail);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TbOrderDetailExists(int id)
        {
            return _context.TbOrderDetails.Any(e => e.OrderId == id);
        }
    }
}
