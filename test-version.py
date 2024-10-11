from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

def open_browser_and_check_versions():
    # Khởi tạo WebDriver
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service)

    # Mở trang AWS
    driver.get("https://aws.amazon.com")

    # Đợi một chút để trang tải hoàn toàn
    time.sleep(5)  # Thay đổi thời gian nếu cần

    # Lấy phiên bản của Chrome
    chrome_version = driver.capabilities['browserVersion']
    chrome_driver_version = driver.capabilities['chrome']['chromedriverVersion'].split(' ')[0]

    # In ra các phiên bản
    print("Chrome version:", chrome_version)
    print("ChromeDriver version:", chrome_driver_version)

    # Đóng trình duyệt
    driver.quit()

if __name__ == "__main__":
    open_browser_and_check_versions()
