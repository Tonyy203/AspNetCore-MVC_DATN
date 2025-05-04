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
    public class SuppliersController : Controller
    {
        private readonly PhotodbContext _context;

        public SuppliersController(PhotodbContext context)
        {
            _context = context;
        }

        // GET: Admin/Suppliers
        public async Task<IActionResult> Index()
        {
            return View(await _context.TbSuppliers.ToListAsync());
        }

        // GET: Admin/Suppliers/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbSupplier = await _context.TbSuppliers
                .FirstOrDefaultAsync(m => m.Id == id);
            if (tbSupplier == null)
            {
                return NotFound();
            }

            return View(tbSupplier);
        }

        // GET: Admin/Suppliers/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/Suppliers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name,Email,Phone,Address")] TbSupplier tbSupplier)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tbSupplier);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(tbSupplier);
        }

        // GET: Admin/Suppliers/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbSupplier = await _context.TbSuppliers.FindAsync(id);
            if (tbSupplier == null)
            {
                return NotFound();
            }
            return View(tbSupplier);
        }

        // POST: Admin/Suppliers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,Email,Phone,Address")] TbSupplier tbSupplier)
        {
            if (id != tbSupplier.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tbSupplier);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TbSupplierExists(tbSupplier.Id))
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
            return View(tbSupplier);
        }

        // GET: Admin/Suppliers/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbSupplier = await _context.TbSuppliers
                .FirstOrDefaultAsync(m => m.Id == id);
            if (tbSupplier == null)
            {
                return NotFound();
            }

            return View(tbSupplier);
        }

        // POST: Admin/Suppliers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var tbSupplier = await _context.TbSuppliers.FindAsync(id);
            if (tbSupplier != null)
            {
                _context.TbSuppliers.Remove(tbSupplier);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TbSupplierExists(int id)
        {
            return _context.TbSuppliers.Any(e => e.Id == id);
        }
    }
}
