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
    public class FeedbacksController : Controller
    {
        private readonly PhotodbContext _context;

        public FeedbacksController(PhotodbContext context)
        {
            _context = context;
        }

        // GET: Admin/Feedbacks
        public async Task<IActionResult> Index()
        {
            return View(await _context.TbFeedbacks.ToListAsync());
        }

        // GET: Admin/Feedbacks/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbFeedback = await _context.TbFeedbacks
                .FirstOrDefaultAsync(m => m.Id == id);
            if (tbFeedback == null)
            {
                return NotFound();
            }

            return View(tbFeedback);
        }

        // GET: Admin/Feedbacks/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/Feedbacks/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name,Email,Phone,Address,Detail")] TbFeedback tbFeedback)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tbFeedback);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(tbFeedback);
        }

        // GET: Admin/Feedbacks/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbFeedback = await _context.TbFeedbacks.FindAsync(id);
            if (tbFeedback == null)
            {
                return NotFound();
            }
            return View(tbFeedback);
        }

        // POST: Admin/Feedbacks/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,Email,Phone,Address,Detail")] TbFeedback tbFeedback)
        {
            if (id != tbFeedback.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tbFeedback);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TbFeedbackExists(tbFeedback.Id))
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
            return View(tbFeedback);
        }

        // GET: Admin/Feedbacks/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbFeedback = await _context.TbFeedbacks
                .FirstOrDefaultAsync(m => m.Id == id);
            if (tbFeedback == null)
            {
                return NotFound();
            }

            return View(tbFeedback);
        }

        // POST: Admin/Feedbacks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var tbFeedback = await _context.TbFeedbacks.FindAsync(id);
            if (tbFeedback != null)
            {
                _context.TbFeedbacks.Remove(tbFeedback);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TbFeedbackExists(int id)
        {
            return _context.TbFeedbacks.Any(e => e.Id == id);
        }
    }
}
