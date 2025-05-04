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
    public class ConfigsController : Controller
    {
        private readonly PhotodbContext _context;

        public ConfigsController(PhotodbContext context)
        {
            _context = context;
        }

        // GET: Admin/Configs
        public async Task<IActionResult> Index()
        {
            return View(await _context.TbConfigs.ToListAsync());
        }

        // GET: Admin/Configs/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbConfig = await _context.TbConfigs
                .FirstOrDefaultAsync(m => m.Id == id);
            if (tbConfig == null)
            {
                return NotFound();
            }

            return View(tbConfig);
        }

        // GET: Admin/Configs/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/Configs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name,Type,Value,Status")] TbConfig tbConfig)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tbConfig);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(tbConfig);
        }

        // GET: Admin/Configs/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbConfig = await _context.TbConfigs.FindAsync(id);
            if (tbConfig == null)
            {
                return NotFound();
            }
            return View(tbConfig);
        }

        // POST: Admin/Configs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,Type,Value,Status")] TbConfig tbConfig)
        {
            if (id != tbConfig.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tbConfig);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TbConfigExists(tbConfig.Id))
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
            return View(tbConfig);
        }

        // GET: Admin/Configs/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var tbConfig = await _context.TbConfigs
                .FirstOrDefaultAsync(m => m.Id == id);
            if (tbConfig == null)
            {
                return NotFound();
            }

            return View(tbConfig);
        }

        // POST: Admin/Configs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var tbConfig = await _context.TbConfigs.FindAsync(id);
            if (tbConfig != null)
            {
                _context.TbConfigs.Remove(tbConfig);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TbConfigExists(int id)
        {
            return _context.TbConfigs.Any(e => e.Id == id);
        }
    }
}
