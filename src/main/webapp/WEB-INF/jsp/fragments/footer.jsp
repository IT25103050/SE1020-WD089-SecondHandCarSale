<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="bg-white pt-5 pb-4 mt-auto border-top">
    <div class="container">
        <div class="row gy-4 mb-5">
            <div class="col-lg-3 col-md-6">
                <h4 class="fw-bolder tracking-tight text-dark mb-3">Auto<span class="text-primary">Mart</span></h4>
                <p class="text-secondary fs-7 pe-lg-3">
                    The premier marketplace for buying and selling quality second-hand vehicles online.
                </p>
            </div>
            <div class="col-lg-2 col-md-6">
                <h6 class="text-dark fw-bold text-uppercase tracking-wider fs-8 mb-3">Company</h6>
                <ul class="list-unstyled d-flex flex-column gap-2 fs-7">
                    <li><a href="#" class="text-secondary text-decoration-none">About Us</a></li>
                    <li><a href="#" class="text-secondary text-decoration-none">Contact Us</a></li>
                    <li><a href="#" class="text-secondary text-decoration-none">Careers</a></li>
                </ul>
            </div>
            <div class="col-lg-2 col-md-6">
                <h6 class="text-dark fw-bold text-uppercase tracking-wider fs-8 mb-3">Legal</h6>
                <ul class="list-unstyled d-flex flex-column gap-2 fs-7">
                    <li><a href="#" class="text-secondary text-decoration-none">Sitemap</a></li>
                    <li><a href="#" class="text-secondary text-decoration-none">Privacy Policy</a></li>
                    <li><a href="#" class="text-secondary text-decoration-none">Terms of Service</a></li>
                </ul>
            </div>
            <div class="col-lg-5 col-md-6">
                <h6 class="text-dark fw-bold text-uppercase tracking-wider fs-8 mb-3">Newsletter</h6>
                <p class="text-secondary fs-7 mb-3">
                    Stay up to date with our latest stock.
                </p>
                <form class="d-flex gap-2">
                    <input type="email" class="form-control bg-light border-0" placeholder="Email address" required>
                    <button class="btn btn-primary px-4 fw-medium" type="submit">Subscribe</button>
                </form>
            </div>
        </div>
        <div class="text-center text-secondary fs-7 pt-4 border-top">
            &copy; <%= java.time.LocalDate.now().getYear() %> AutoMart. All rights reserved.
        </div>
    </div>
</footer>
