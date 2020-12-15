#!/usr/bin/env python3
# -*- coding: iso-8859-15 -*-

"""
At the moment I'm running all the tests manually.
"""

from cyvec import *
import pygame


w, h = 500, 500

star = vec2(w//2,h//2)
planet_pos = vec2(w//2+100,h//2)
planet_vel = vec2(0,5)
G = 4E3
dt = 1E-2

pygame.init()
screen = pygame.display.set_mode([w, h])

running = True
while running:
	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			running = False

	# Calcs
	r2 = distance_sqr(planet_pos, star)
	force = look_at(planet_pos, star) * G / r2
	planet_vel = planet_vel + force*dt
	planet_pos = planet_pos + planet_vel*dt

	# Graphics
	screen.fill((0, 0, 0))
	pygame.draw.circle(screen, (255, 100, 0), star.to_screen(), 10)
	pygame.draw.circle(screen, (100, 100, 255), planet_pos.to_screen(), 4)
	pygame.display.flip()

pygame.quit()
