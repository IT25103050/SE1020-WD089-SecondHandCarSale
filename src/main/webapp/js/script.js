// Client-side interactions for AutoMart Platform
document.addEventListener("DOMContentLoaded", function () {
    // Auto-dismiss bootstrap alerts after 5 seconds if present
    const alerts = document.querySelectorAll('.alert-auto-dismiss');
    alerts.forEach(alert => {
        setTimeout(() => {
            alert.style.transition = 'opacity 0.5s ease';
            alert.style.opacity = '0';
            setTimeout(() => alert.remove(), 500);
        }, 5000);
    });

    // Simple tooltip initialization or standard interactivity hooks can be added here
});
