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
    public class ProductCategoriesController : Controller
    {
        private readonly PhotodbContext _context;

        public ProductCategoriesController(PhotodbContext context)
        {
            _context = context;
        }

        // GET: Admin/ProductCategories
        public async Task<IActionResult> Index()
        {
            return View(await _context.TbProductCategories.ToListAsync());
        }

        // GET: Admin/ProductCategories/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbProductCategory = await _context.TbProductCategories
                .FirstOrDefaultAsync(m => m.CateId == id);
            if (tbProductCategory == null)
            {
                return NotFound();
            }

            return View(tbProductCategory);
        }

        // GET: Admin/ProductCategories/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/ProductCategories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CateId,Name,SeoTitle,Status,Sort,ParentId,MetaKeywords,MetaDescriptions,CreatedBy,CreatedDate,UpdatedBy,UpdateDate")] TbProductCategory tbProductCategory)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tbProductCategory);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(tbProductCategory);
        }

        // GET: Admin/ProductCategories/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbProductCategory = await _context.TbProductCategories.FindAsync(id);
            if (tbProductCategory == null)
            {
                return NotFound();
            }
            return View(tbProductCategory);
        }

        // POST: Admin/ProductCategories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CateId,Name,SeoTitle,Status,Sort,ParentId,MetaKeywords,MetaDescriptions,CreatedBy,CreatedDate,UpdatedBy,UpdateDate")] TbProductCategory tbProductCategory)
        {
            if (id != tbProductCategory.CateId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tbProductCategory);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TbProductCategoryExists(tbProductCategory.CateId))
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
            return View(tbProductCategory);
        }

        // GET: Admin/ProductCategories/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbProductCategory = await _context.TbProductCategories
                .FirstOrDefaultAsync(m => m.CateId == id);
            if (tbProductCategory == null)
            {
                return NotFound();
            }

            return View(tbProductCategory);
        }

        // POST: Admin/ProductCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var tbProductCategory = await _context.TbProductCategories.FindAsync(id);
            if (tbProductCategory != null)
            {
                _context.TbProductCategories.Remove(tbProductCategory);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TbProductCategoryExists(int id)
        {
            return _context.TbProductCategories.Any(e => e.CateId == id);
        }
    }
}
