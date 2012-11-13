/*
 * Copyright (C) 2012 Frodon Electronics
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License version 2 as
 *  published by the Free Software Foundation.
 */

#include <linux/init.h>
#include <linux/module.h>
#include <linux/input.h>
#include <linux/platform_device.h>

static int __devinit dummy_probe(struct platform_device *pdev)
{
	struct input_dev *input_dev;
	int rc;

	input_dev = input_allocate_device();
	if (!input_dev) {
		rc = -ENOMEM;
		return rc;
	}

	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
	input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);

	input_dev->name = "Dummy Touchscreen";
	input_dev->id.bustype = BUS_VIRTUAL;
	input_dev->id.vendor = 0x1987;
	input_dev->id.product = 0x1111;
	input_dev->id.version = 0xbeef;
	input_set_abs_params(input_dev, ABS_X, 0, 1920, 0, 0);
	input_set_abs_params(input_dev, ABS_Y, 0, 1080, 0, 0);
	input_set_abs_params(input_dev, ABS_PRESSURE, 0, 255, 0, 0);

	rc = input_register_device(input_dev);
	if (rc)
		goto err_free_input;
	platform_set_drvdata(pdev, input_dev);

	return 0;

err_free_input:
	input_free_device(input_dev);

	return rc;
}

static int __devexit dummyts_remove(struct platform_device *pdev)
{
	struct input_dev *input_dev;

	input_dev = platform_get_drvdata(pdev);

	input_unregister_device(input_dev);
	input_free_device(input_dev);
	platform_set_drvdata(pdev, NULL);

	return 0;
}

static struct platform_driver dummyts_driver = {
	.driver = {
		.name	= "dummy-ts",
		.owner	= THIS_MODULE,
	},
	.probe	= dummy_probe,
	.remove	= __devexit_p(dummyts_remove),
};

static struct platform_device *pdev;

static int __init dummyts_init(void)
{
	int rc;

	rc = platform_driver_register(&dummyts_driver);
	if (rc < 0)
		return rc;

	pdev = platform_device_register_simple("dummy-ts",
					-1, NULL, 0);
	if (IS_ERR(pdev)) {
		printk(KERN_ERR "dummy_ts: platform_register failed\n");
		rc = PTR_ERR(pdev);
		return rc;
	}

	return 0;
}

static void __exit dummyts_exit(void)
{
	platform_device_unregister(pdev);
	platform_driver_unregister(&dummyts_driver);
}

module_init(dummyts_init);
module_exit(dummyts_exit);

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("Dummy Touchscreen driver for android test");
MODULE_AUTHOR("Fudong Bai <fudongbai@gmail.com>");
MODULE_ALIAS("dummy-ts");
