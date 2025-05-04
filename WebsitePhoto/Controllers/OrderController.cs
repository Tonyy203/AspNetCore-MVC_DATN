using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebsitePhoto.Models;
using System.Linq;
using System.Threading.Tasks;

namespace WebsitePhoto.Controllers
{
    public class OrderController : Controller
    {
        private readonly PhotodbContext _context;

        public OrderController(PhotodbContext context)
        {
            _context = context;
        }

        // GET: /Order
        public async Task<IActionResult> Index()
        {
            var orders = await _context.TbOrders.ToListAsync();
            return View(orders);
        }

        // GET: /Order/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();

            var order = await _context.TbOrders.FirstOrDefaultAsync(m => m.OrderId == id);
            if (order == null) return NotFound();

            return View(order);
        }

        // GET: /Order/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: /Order/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("OrderId,OrderDate,Status,Delivered,DeliveryDate,CustomerId,Discount")] TbOrder order)
        {
            if (ModelState.IsValid)
            {
                _context.Add(order);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(order);
        }

        // GET: /Order/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();

            var order = await _context.TbOrders.FindAsync(id);
            if (order == null) return NotFound();

            return View(order);
        }

        // POST: /Order/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("OrderId,OrderDate,Status,Delivered,DeliveryDate,CustomerId,Discount")] TbOrder order)
        {
            if (id != order.OrderId) return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(order);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TbOrderExists(order.OrderId))
                        return NotFound();
                    else
                        throw;
                }
                return RedirectToAction(nameof(Index));
            }
            return View(order);
        }

        // GET: /Order/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();

            var order = await _context.TbOrders.FirstOrDefaultAsync(m => m.OrderId == id);
            if (order == null) return NotFound();

            return View(order);
        }

        // POST: /Order/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var order = await _context.TbOrders.FindAsync(id);
            if (order != null)
            {
                _context.TbOrders.Remove(order);
                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index));
        }

        private bool TbOrderExists(int id)
        {
            return _context.TbOrders.Any(e => e.OrderId == id);
        }
    }
}
