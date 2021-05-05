import os

import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("main")

logger.info('Hello from Python!')
logger.info(os.environ["EXAMPLE_WELCOME"])
