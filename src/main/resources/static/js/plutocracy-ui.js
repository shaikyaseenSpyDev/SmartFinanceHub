/**
 * Plutocracy UI Enhancement Script
 * Developed by SpyDev
 */

// Wait for DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
  // Initialize components
  initializeComponents();

  // Setup event listeners
  setupEventListeners();

  // Enable dark mode toggle
  setupDarkModeToggle();

  // Setup responsive charts
  setupCharts();
});

/**
 * Initialize UI components
 */
function initializeComponents() {
  // Add custom classes to existing elements
  document.querySelectorAll('.card').forEach(card => {
    card.classList.add('plutocracy-card');
  });

  document.querySelectorAll('.btn-primary').forEach(btn => {
    btn.classList.add('plutocracy-button', 'plutocracy-button-primary');
  });

  document.querySelectorAll('.form-control').forEach(input => {
    input.classList.add('plutocracy-form-control');
  });

  // Add animation classes to dashboard elements
  const dashboardItems = document.querySelectorAll('.dashboard-item');
  dashboardItems.forEach((item, index) => {
    item.style.animationDelay = `${index * 0.1}s`;
    item.classList.add('animate-in');
  });
}

/**
 * Setup event listeners for interactive elements
 */
function setupEventListeners() {
  // Toast notifications
  const toastButtons = document.querySelectorAll('[data-toggle="toast"]');
  toastButtons.forEach(button => {
    button.addEventListener('click', function() {
      const message = this.getAttribute('data-message');
      const type = this.getAttribute('data-type') || 'info';
      showToast(message, type);
    });
  });

  // Form validation
  const forms = document.querySelectorAll('.needs-validation');
  forms.forEach(form => {
    form.addEventListener('submit', function(event) {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  });
}

/**
 * Show toast notification
 * @param {string} message - Message to display
 * @param {string} type - Type of toast (success, error, info, warning)
 */
function showToast(message, type = 'info') {
  const toast = document.createElement('div');
  toast.className = `plutocracy-toast plutocracy-toast-${type}`;
  toast.textContent = message;

  document.body.appendChild(toast);

  // Trigger animation
  setTimeout(() => {
    toast.classList.add('show');
  }, 10);

  // Remove after delay
  setTimeout(() => {
    toast.classList.remove('show');
    setTimeout(() => {
      document.body.removeChild(toast);
    }, 300);
  }, 3000);
}

/**
 * Setup dark mode toggle functionality
 */
function setupDarkModeToggle() {
  const darkModeToggle = document.createElement('button');
  darkModeToggle.className = 'plutocracy-dark-mode-toggle';
  darkModeToggle.innerHTML = '<i class="fas fa-moon"></i>';
  darkModeToggle.setAttribute('title', 'Toggle Dark Mode');

  // Check for saved preference
  const isDarkMode = localStorage.getItem('plutocracy-dark-mode') === 'true';
  if (isDarkMode) {
    document.body.classList.add('dark-mode');
    darkModeToggle.innerHTML = '<i class="fas fa-sun"></i>';
  }

  darkModeToggle.addEventListener('click', function() {
    document.body.classList.toggle('dark-mode');
    const isDark = document.body.classList.contains('dark-mode');
    localStorage.setItem('plutocracy-dark-mode', isDark);
    darkModeToggle.innerHTML = isDark ? '<i class="fas fa-sun"></i>' : '<i class="fas fa-moon"></i>';
  });

  // Append toggle to the page
  document.body.appendChild(darkModeToggle);
}

/**
 * Setup responsive financial charts
 */
function setupCharts() {
  // Check if charts library is available
  if (typeof Chart === 'undefined') {
    // Load Chart.js dynamically
    const script = document.createElement('script');
    script.src = 'https://cdn.jsdelivr.net/npm/chart.js';
    script.onload = initializeCharts;
    document.head.appendChild(script);
  } else {
    initializeCharts();
  }
}

/**
 * Initialize financial charts
 */
function initializeCharts() {
  // Find canvas elements for charts
  const chartCanvases = document.querySelectorAll('.plutocracy-chart');

  chartCanvases.forEach(canvas => {
    const chartType = canvas.getAttribute('data-chart-type') || 'line';
    const chartId = canvas.getAttribute('id');

    // Get color scheme based on current theme
    const isDark = document.body.classList.contains('dark-mode');
    const colorScheme = isDark ? {
      backgroundColor: 'rgba(67, 97, 238, 0.2)',
      borderColor: 'rgba(67, 97, 238, 1)',
      textColor: '#e6e6e6'
    } : {
      backgroundColor: 'rgba(67, 97, 238, 0.2)',
      borderColor: 'rgba(67, 97, 238, 1)',
      textColor: '#333'
    };

    // Create appropriate chart based on data attributes
    if (chartId) {
      createChart(canvas, chartType, colorScheme);
    }
  });
}

/**
 * Create a financial chart
 * @param {HTMLCanvasElement} canvas - Canvas element
 * @param {string} type - Chart type
 * @param {Object} colors - Color scheme
 */
function createChart(canvas, type, colors) {
  // Demo data - in a real app this would come from API
  const demoData = {
    labels: ['January', 'February', 'March', 'April', 'May', 'June'],
    datasets: [{
      label: 'Financial Overview',
      backgroundColor: colors.backgroundColor,
      borderColor: colors.borderColor,
      borderWidth: 2,
      data: [1200, 1900, 3000, 5000, 2000, 3000],
      tension: 0.4
    }]
  };

  // Create chart
  new Chart(canvas, {
    type: type,
    data: demoData,
    options: {
      responsive: true,
      maintainAspectRatio: false,
      scales: {
        y: {
          beginAtZero: true,
          grid: {
            color: 'rgba(200, 200, 200, 0.1)'
          },
          ticks: {
            color: colors.textColor
          }
        },
        x: {
          grid: {
            display: false
          },
          ticks: {
            color: colors.textColor
          }
        }
      },
      plugins: {
        legend: {
          labels: {
            color: colors.textColor
          }
        }
      }
    }
  });
}
