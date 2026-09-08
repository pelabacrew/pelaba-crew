// Menu mobile
const toggle = document.querySelector(".nav-toggle");
const menu = document.querySelector(".nav-menu");

toggle?.addEventListener("click", () => {
  const open = menu.classList.toggle("open");
  toggle.setAttribute("aria-expanded", open);
});

document.querySelectorAll(".nav-menu a").forEach(link => {
  link.addEventListener("click", () => menu.classList.remove("open"));
});

// Efek header saat scroll
const header = document.querySelector(".site-header");
window.addEventListener("scroll", () => {
  header.classList.toggle("scrolled", window.scrollY > 30);
});

// Smooth reveal sederhana
const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add("visible");
      observer.unobserve(entry.target);
    }
  });
}, { threshold: 0.12 });

document.querySelectorAll(".program-card, .activity, .news-list article").forEach(el => {
  el.classList.add("reveal");
  observer.observe(el);
});
