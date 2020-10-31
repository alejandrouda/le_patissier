const tabsContainer = document.querySelector('.products__tab-container');
const productsTab = document.querySelectorAll('.products__tab');
const tabsContent = document.querySelectorAll('.products__content');

const tabs = function () {
  tabsContainer.addEventListener('click', function (event) {
    event.preventDefault();
    const clicked = event.target.closest('.products__tab');
    if (!clicked) return;

    productsTab.forEach(tab => tab.classList.remove('products__tab--active'));
    clicked.classList.add('products__tab--active');

    const content = document.querySelector(
      `.products__content--${clicked.dataset.tab}`
    );
    tabsContent.forEach(content =>
      content.classList.remove('products__content--active')
    );
    content.classList.add('products__content--active');
  });
};
export { tabs };
